file = ARGS[1]

fs = open(file)

filename = match(r"^(.+)\.md$", file)[1]

tmp = []
tag = []
out = []

while !eof(fs)
  x = readline(fs)
  if ismatch(r"^##", x)
    push!(tag, x)
    push!(out, tmp)
    tmp = []
  end
  push!(tmp, x)
end

push!(out, tmp)

rm(filename, force=true, recursive=true)
mkdir(filename)

@sync @parallel for i=1:length(out)
  write(string(filename, "/", i), out[i])
end