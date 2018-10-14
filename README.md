# CloudFlare::DynamicDNS

Use the power of cloudflare to power your dynamic DNS. Don't rely on shady 3rd
party tools on the internet that charge you money. Cloudflare also provides a
way to hide your ip from the world along with DDOS protection. Should i say 
anymore?

## Installation

You need a computer inside your network to run this, ideally something small and
tiny, i use a raspberry pi 3b+ in my network, you can get one for under 40$. In
Raspbian, you can install `cloudflare-dynamic-dns` by running the following commands:

```bash
sudo apt-get install update
sudo apt-get install -y ruby
sudo gem install cloudflare-dynamic-dns
```

You should then be able to invoke `cloudflare-dynamic-dns` in your command line:

```bash
cloudflare-dynamic-dns
```

## Configuration

`cloudflare-dynamic-dns` looks for a file called `/etc/cloudflare-dynamic-dns.conf`.
This file needs to be readable by the user executing this, else you will need to use
`sudo cloudflare-dynamic-dns` which is generally not recommended.

Here is a sample configuration of `cloudflare-dynamic-dns`:
```bash
email=email-you-registered@with-cloudflare.com
key=your-api-key
zone=example.com
hostname=kickass.example.com
```

and then run `cloudflare-dynamic-dns`. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cloudflare-dynamic-dns. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cloudflare::Ddns project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cloudflare-dynamic-dns/blob/master/CODE_OF_CONDUCT.md).
