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
immutable Nil{T}  <: BSTree{T} end
immutable Node{T} <: BSTree{T}
    value::T
    left ::BSTree{T}
    right::BSTree{T}
end


isempty(tree::Node) = false
isempty(tree::Nil)  = true


function insert{T}(value::T, tree::Nil{T})
    #=
    It is nessicary to define retval as a BSTree.
    By default the constructor returns type Node.
    =#
    retval::BSTree = Node(value, tree, tree)
end


function insert{T}(value::T, tree::Node{T})
    if value < tree.value
        left  = insert(value, tree.left)
        right = tree.right
    elseif value > tree.value
        left  = tree.left
        right = insert(value, tree.right)
    end
    Node(tree.value, left, right)
end


inorder(tree::Nil) = nothing
function inorder(tree::Node)
    inorder(tree.left)
    produce(tree.value)
    inorder(tree.right)
end


function readfile(filename::AbstractString)
    #= generators have lower memory profile =#
    f = open(filename)

    const terms = [' ', '"', ',']
    str  = readuntil(f, terms[end])
    while !eof(f)
        for nc = terms
            str = filter(x -> x != nc, str)
        end

        produce(str)
        str = readuntil(f, terms[end])
    end
    close(f)
end


function solution(filename="p022_names.txt")

    tree::BSTree = Nil{AbstractString}()
    for name in @task readfile(filename)
        tree = insert(name, tree)
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
