#!/usr/bin/env julia

abstract BSTree{T}

type Nil{T} <: BSTree{T}
end

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
    if !isa(tree.left, Nil)
        inorder(tree.left)
    end
    produce(tree.value)

    if !isa(tree.right, Nil)
        inorder(tree.right)
    end
end



function readfile(filename)
    #= generators are lower memory profile =#
    f = open(filename)
    term = ','
    str = readuntil(f, term)
    while !eof(f)
        produce(str[2:end-2])
        str = readuntil(f, term)
        if str[end] != term
            break
        end
    end
    produce(str[2:end-1])
    close(f)
end


function solution(filename::AbstractString="p022_names.txt")

    tree::BSTree = Nil{Any}()
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
