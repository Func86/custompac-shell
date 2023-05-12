#! /bin/zsh

function valid {
  local N
  local data
  local domain
  while read data; do
    domain=($(echo $data | tr . ' ')); 
    N=$((${#domain[@]} - 1))
    if ! exists ${(j:.:)domain:$((N--))}; then continue; fi
    for ((; N >= 0; N--)); do 
      data=${(j:.:)domain:$N}
      if exists $data; then continue; fi  
      UNIQ[$data]=1
      break
    done
  done
}

function exists {
  if [[ $XLD[$1] = 1 ]]; 
  then return 0
  else return 1
  fi  
}
