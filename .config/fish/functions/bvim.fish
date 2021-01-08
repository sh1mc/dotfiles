# Defined in - @ line 1
function bvim --wraps='nvim +:Vinarise' --description 'alias bvim=nvim +:Vinarise'
  nvim +:Vinarise $argv;
end
