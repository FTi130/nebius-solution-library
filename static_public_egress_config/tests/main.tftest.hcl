run "wireguard_apply" {
  command = apply
}

run "test_mode_wireguard_apply" {
  command = apply

  variables {
    test_mode = true
  }
}
