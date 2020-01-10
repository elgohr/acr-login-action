#!/usr/bin/env bats

@test "it returns the username and password" {
  export INPUT_SERVICE_PRINCIPAL="PRINCIPAL"
  export INPUT_SERVICE_PRINCIPAL_PASSWORD="AZURE_PASSWORD"
  export INPUT_TENANT="TENANT"
  export INPUT_REGISTRY="REGISTRY"
  export INPUT_REPOSITORY="REPOSITORY"

  run /entrypoint.sh

    local expected='::add-mask::AZURE_PASSWORD
::set-output name=username::USERNAME
::add-mask::PASSWORD
::set-output name=password::PASSWORD'
    echo $output
    [ "$output" = "$expected" ]
}
