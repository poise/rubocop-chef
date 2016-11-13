# frozen_string_literal: true

describe RuboCop::Chef::CookbookOnly do
  subject(:cop) { fake_cop.new(config) }
  let(:segments) { nil }
  let(:all_cop_config) { {} }
  let(:config) do
    rubocop_config =
      {
        'AllCops' => all_cop_config,
        'RSpec/FakeCop' => {
          'Exclude' => %w(recipes/ignored.rb)
        }
      }

    RuboCop::Config.new(rubocop_config, 'fake_cop_config.yml')
  end
  let(:fake_cop) do
    s = segments
    Class.new(RuboCop::Cop::Cop) do
      if s
        include RuboCop::Chef::CookbookOnly(s)
      else
        include RuboCop::Chef::CookbookOnly
      end

      def self.name
        'RuboCop::RSpec::FakeCop'
      end

      def on_send(node)
        add_offense(node, :expression, 'boom')
      end
    end
  end

  context 'when the source path is metadata.rb' do
    it 'registers an offense' do
      expect_violation(<<-RUBY, filename: 'metadata.rb')
        foo(1)
        ^^^^^^ boom
      RUBY
    end

    context 'with the metadata segment enabled' do
      let(:segments) { {metadata: true} }

      it 'registers an offense' do
        expect_violation(<<-RUBY, filename: 'metadata.rb')
          foo(1)
          ^^^^^^ boom
        RUBY
      end
    end # /context with the metadata segment enabled

    context 'with the metadata segment disabled' do
      let(:segments) { {metadata: false} }

      it 'ignores the source' do
        expect_no_violations(<<-RUBY, filename: 'metadata.rb')
          foo(1)
        RUBY
      end
    end # /context with the metadata segment disabled
  end # /context when the source path is metadata.rb

  context 'when the source path is recipes/default.rb' do
    it 'registers an offense' do
      expect_violation(<<-RUBY, filename: 'recipes/default.rb')
        foo(1)
        ^^^^^^ boom
      RUBY
    end

    context 'with the recipes segment enabled' do
      let(:segments) { {recipes: true} }

      it 'registers an offense' do
        expect_violation(<<-RUBY, filename: 'recipes/default.rb')
          foo(1)
          ^^^^^^ boom
        RUBY
      end
    end # /context with the recipes segment enabled

    context 'with the recipes segment disabled' do
      let(:segments) { {recipes: false} }

      it 'ignores the source' do
        expect_no_violations(<<-RUBY, filename: 'recipes/default.rb')
          foo(1)
        RUBY
      end
    end # /context with the recipes segment disabled
  end # /context when the source path is recipes/default.rb

  context 'when the source path is recipes/ignored.rb' do
      it 'ignores the source' do
        expect_no_violations(<<-RUBY, filename: 'recipes/ignored.rb')
          foo(1)
        RUBY
      end

    context 'with the recipes segment enabled' do
      let(:segments) { {recipes: true} }

      it 'ignores the source' do
        expect_no_violations(<<-RUBY, filename: 'recipes/ignored.rb')
          foo(1)
        RUBY
      end
    end # /context with the recipes segment enabled

    context 'with the recipes segment disabled' do
      let(:segments) { {recipes: false} }

      it 'ignores the source' do
        expect_no_violations(<<-RUBY, filename: 'recipes/ignored.rb')
          foo(1)
        RUBY
      end
    end # /context with the recipes segment disabled
  end # /context when the source path is recipes/ignored.rb

  context 'when custom patterns are specified' do
    let(:all_cop_config) do
      {'ChefRecipes' => {'Patterns' => ['chef/recipes/.*\\.rb']}}
    end

    it 'registers offenses when the path matches a custom specified pattern' do
      expect_violation(<<-RUBY, filename: 'chef/recipes/default.rb')
        foo(1)
        ^^^^^^ boom
      RUBY
    end
  end
end
