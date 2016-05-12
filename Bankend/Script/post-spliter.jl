#!/usr/bin/env julia
#-*- mode: julia -*-
#-*- code: utf-8 -*-

const rFlag = r"^##"
const rName = r"^(.+)\.md$"


function splitF(f)
    tmp = []
    out = []

    while !eof(f)
        x = readline(f)
        if ismatch(rFlag, x)
            push!(out, tmp)
            tmp = []
        end
        push!(tmp, x)
    end

    push!(out, tmp)
end


function writeF(fn)
    return function(list)
        rm(fn, force=true, recursive=true)
        mkdir(fn)

        @sync @parallel for i=1:length(list)
            write(string(fn, "/", i), list[i])
        end
    end
end


function main(f)
    if !ismatch(rName, f)
        error("Input is not a markdown file.")
    end
    fn = match(rName, f)[1]
    open(f) |> splitF |> writeF(fn)
end


ARGS[1] |> main
