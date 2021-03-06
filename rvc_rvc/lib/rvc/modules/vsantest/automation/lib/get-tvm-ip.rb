#!/usr/bin/ruby
require_relative "rvc-util.rb"
require_relative "util.rb"

@tvm_folder_path_escape = _get_tvm_folder_path_escape[0]

`rvc #{$vc_rvc} --path #{@tvm_folder_path_escape} -c "vm.ip hci-tvm-*" \
-c 'exit' -q | grep -o -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}$" > #{$tmp_path}/tvm.yaml`

`sed -i 's/$/"/g' #{$tmp_path}/tvm.yaml`
`sed -i 's/^/  - "/g' #{$tmp_path}/tvm.yaml`
`sed -i '1i vms:\n' #{$tmp_path}/tvm.yaml`
`sed -i '1i ---\n' #{$tmp_path}/tvm.yaml`
