# Defined in - @ line 1
function bvim --wraps='nvim +:Vinarise +":set modifiable" +":set write"' --description 'alias bvim=nvim +:Vinarise'
  nvim +:Vinarise $argv;
end
