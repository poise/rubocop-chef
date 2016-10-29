# RuboCop-Chef

**THIS IS A WORK IN PROGRESS**

Chef-specific analysis for your projects, as an extension to
[RuboCop](https://github.com/bbatsov/rubocop).

## Conversion Progress

* ~~FC001 Use strings in preference to symbols to access node attributes~~ Chef/AttributeKeys
* ~~FC002 Avoid string interpolation where not required~~ Style/UnneededInterpolation
* ~~FC003 Check whether you are running with chef server before using server-specific features~~ Deprecated because solo supports search
* FC004 Use a service resource to start and stop services
* FC005 Avoid repetition of resource declarations
* FC006 Mode should be quoted or fully specified when setting file permissions
* FC007 Ensure recipe dependencies are reflected in cookbook metadata
* FC008 Generated cookbook metadata needs updating
* FC009 Resource attribute not recognised
* FC010 Invalid search syntax
* FC011 Missing README in markdown format
* FC012 Use Markdown for README rather than RDoc
* FC013 Use file_cache_path rather than hard-coding tmp paths
* FC014 Consider extracting long ruby_block to library
* FC015 Consider converting definition to a Custom Resource
* FC016 LWRP does not declare a default action
* FC017 LWRP does not notify when updated
* FC018 LWRP uses deprecated notification syntax
* ~~FC019 Access node attributes in a consistent manner~~ Chef/AttributeKeys
* FC020 Conditional execution string attribute looks like Ruby
* FC021 Resource condition in provider may not behave as expected
* FC022 Resource condition within loop may not behave as expected
* FC023 Prefer conditional attributes
* FC024 Consider adding platform equivalents
* FC025 Prefer chef_gem to compile-time gem install
* FC026 Conditional execution block attribute contains only string
* FC027 Resource sets internal attribute
* FC028 Incorrect #platform? usage
* FC029 No leading cookbook name in recipe metadata
* FC030 Cookbook contains debugger breakpoints
* FC031 Cookbook without metadata.rb file
* FC032 Invalid notification timing
* FC033 Missing template
* FC034 Unused template variables
* FC035 Template uses node attribute directly
* FC037 Invalid notification action
* FC038 Invalid resource action
* FC039 Node method cannot be accessed with key
* FC040 Execute resource used to run git commands
* FC041 Execute resource used to run curl or wget commands
* FC042 Prefer include_recipe to require_recipe
* FC043 Prefer new notification syntax
* FC044 Avoid bare attribute keys
* FC045 Metadata does not contain cookbook name
* FC046 Attribute assignment uses assign unless nil
* FC047 Attribute assignment does not specify precedence
* FC048 Prefer Mixlib::ShellOut
* FC049 Role name does not match containing file name
* FC050 Name includes invalid characters
* FC051 Template partials loop indefinitely
* FC052 Metadata uses the unimplemented "suggests" keyword
* FC053 Metadata uses the unimplemented "recommends" keyword
* FC055 Ensure maintainer is set in metadata
* FC056 Ensure maintainer_email is set in metadata
* FC057 Library provider does not declare use_inline_resources
* FC058 Library provider declares use_inline_resources and declares \#action_ methods
* FC059 LWRP provider does not declare use_inline_resources
* FC060 LWRP provider declares use_inline_resources and declares \#action_ methods
* FC061 Valid cookbook versions are of the form x.y or x.y.z
* FC062 Cookbook should have version metadata
* FC063 Cookbook incorrectly depends on itself
* FC064 Ensure issues_url is set in metadata
* FC065 Ensure source_url is set in metadata



## Installation

Just install the `rubocop-chef` gem

```bash
chef gem install rubocop-chef
```

## Usage

You need to tell RuboCop to load the Chef extension. There are three
ways to do this:

### RuboCop configuration file

Put this into your `.rubocop.yml`.

```
require: rubocop-chef
```

Now you can run `rubocop` and it will automatically load the RuboCop Chef
cops together with the standard cops.

### Command line

```bash
rubocop --require rubocop-chef
```

### Rake task

```ruby
RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-chef'
end
```

## The Cops

All cops are located under
[`lib/rubocop/cop/chef`](lib/rubocop/cop/chef), and contain
examples/documentation.

In your `.rubocop.yml`, you may treat the Chef cops just like any other
cop. For example:

```yaml
Chef/AttributeKeys:
  Exclude:
    - libraries/my_vendored_file.rb
```

## License

`rubocop-chef` is based on `rubocop-rspec`, which is MIT licensed. [See the accompanying file](MIT-LICENSE.md) for
the full text.
