# Testing

## Unit tests

No unit tests are written at this time.

## Integration tests

1. Run `kitchen test`
2. Take a break--it takes a bit to run the full suite.

### Testing Amazon Linux

Testing Amazon Linux through `test-kitchen` requires a bit more setup:

1. Ensure `kitchen-ec2` is installed: `chef gem install kitchen-ec2`
2. Update `.kitchen.yml` to have the correct AWS key ID you're going to use
3. Set `security_group_ids` in the driver section to include a security group accessible from your laptop. Not setting this will use the `default` security group.
4. Set `transport.ssh_key` to the path of your SSH key. It looks for `id_rsa` by default.

