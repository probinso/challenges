#!/usr/bin/env julia

#=
using Traits

@traitdef Cmp{X,Y} begin
    @constraints begin
        X == Y
    end
    X < Y -> Bool
    # @assert istrait(Cmp{T,T}) == true
end
=#

abstract BSTree{T}
type Nil{T}  <: BSTree{T} end
type Node{T} <: BSTree{T}
    value::T
    left ::BSTree{T}
    right::BSTree{T}
end


isempty(tree::Node) = false
isempty(tree::Nil)  = true


function insert!{T}(value::T, tree::Nil{T})
    retval::BSTree = Node{T}(value, Nil{T}(), Nil{T}())
end


function insert!{T}(value::T, tree::Node{T})
    if value < tree.value
        tree.left  = insert!(value, tree.left)
    elseif value > tree.value
        tree.right = insert!(value, tree.right)
    end
    tree
end


inorder(tree::Nil) = nothing
function inorder(tree::Node)
    inorder(tree.left)
    produce(tree.value)
    inorder(tree.right)
end


function remChar{T<:AbstractString}(str::T, c::Char...)
    value::T = ""
    for i = 1:endof(str)
        try
            if str[i] != c
                value = string(value, str[i])
            end
        catch
            #ignore the index error
        end
    end
    value
end


function readfile(filename::AbstractString)
    #= generators are lower memory profile =#
    f = open(filename)
    term = ','
    str = readuntil(f, term)
    while !eof(f)
        str = remChar(str,), ' ', ',')
        produce(str)
        str = readuntil(f, term)
    end
    close(f)
end


function solution(filename="p022_names.txt")

    tree::BSTree = Nil{AbstractString}()
    for name in @task readfile(filename)
        tree = insert!(name, tree)
    end

    function score(name::AbstractString)
        char_score(c) = c - 'A' + 1
        sum(map(char_score, collect(name)))
    end

    acc = 0
    for (i, name) in enumerate(@task inorder(tree))
        acc += i*score(name)
    end
    acc
end

println(solution())
