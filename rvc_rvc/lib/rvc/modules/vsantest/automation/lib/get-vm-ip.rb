#!/usr/bin/ruby
require_relative "rvc-util.rb"
require_relative "util.rb"

@folder_path_escape = _get_folder_path_escape[0]

`rvc #{$vc_rvc} --path #{@folder_path_escape} -c "vm.ip #{$vm_prefix}-*" \
-c 'exit' -q | grep -o -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}$" > #{$tmp_path}/vm.yaml`
`sed -i 's/$/"/g' #{$tmp_path}/vm.yaml`
`sed -i 's/^/  - "/g' #{$tmp_path}/vm.yaml`
`sed -i '1i vms:\n' #{$tmp_path}/vm.yaml`
`sed -i '1i ---\n' #{$tmp_path}/vm.yaml`