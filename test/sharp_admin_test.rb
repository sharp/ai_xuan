require 'test_helper'


require 'sharp_admin/sharp_admin_generator'

class SharpAdminGeneratorTest < Rails::Generators::TestCase

  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination
  tests SharpAdminGenerator

  test "create the controllers and specs" do
    run_generator %w(User --search_by email)

    assert_file "app/controllers/admin/base_controller.rb", /class Admin::BaseController < ApplicationController/
    assert_file "app/controllers/admin/users_controller.rb", /class Admin::UsersController < Admin::BaseController/
    assert_file "spec/controllers/admin/base_controller_spec.rb", /describe Admin::BaseController do/
    assert_file "spec/controllers/admin/users_controller_spec.rb", /describe Admin::UsersController do/
    assert_file "app/views/admin/users/index.html.haml"
    assert_file "app/views/admin/users/show.html.haml"
    assert_file "app/views/admin/users/new.html.haml"
    assert_file "app/views/admin/users/edit.html.haml"
    assert_file "app/views/admin/users/_form.html.haml"
    assert_file "app/helpers/admin/base_helper.rb", /def sortable/
  end

  test "-ns option with namespace" do
    run_generator %w(User --ns namespace)
    assert_file "app/controllers/namespace/base_controller.rb", /class Admin::BaseController < ApplicationController/
    assert_file "app/controllers/namespace/users_controller.rb", /class Admin::UsersController < Admin::BaseController/
    assert_file "spec/controllers/namespace/base_controller_spec.rb", /describe Admin::BaseController do/
    assert_file "spec/controllers/namespace/users_controller_spec.rb", /describe Admin::UsersController do/
    assert_file "app/views/namespace/users/index.html.haml"
    assert_file "app/views/namespace/users/show.html.haml"
    assert_file "app/views/namespace/users/new.html.haml"
    assert_file "app/views/namespace/users/edit.html.haml"
    assert_file "app/views/namespace/users/_form.html.haml"
    assert_file "app/helpers/namespace/base_helper.rb", /def sortable/
  end

  test "--no-create option skips assets to create new record" do
    run_generator %w(User --no_create)

    assert_no_file "app/views/admin/users/new.html.haml"

    content = File.read("tmp/app/views/admin/users/index.html.haml")
    assert content !~ /Create a new/

    content = File.read("tmp/app/controllers/admin/users_controller.rb")
    assert content !~ /def new/
    assert content !~ /def create/

    controller_spec_content = File.read("tmp/spec/controllers/admin/users_controller_spec.rb")
    assert controller_spec_content !~ /GET new/
    assert controller_spec_content !~ /POST create/
  end

  test "--read_only skips create, edit and update" do
    run_generator %w(User --read_only)

    assert_no_file "app/views/admin/users/new.html.haml"
    assert_no_file "app/views/admin/users/edit.html.haml"
    assert_no_file "app/views/admin/users/_form.html.haml"

    index_content = File.read("tmp/app/views/admin/users/index.html.haml")
    assert index_content !~ /Create a new/
    assert index_content !~ /Edit/

    controller_content = File.read("tmp/app/controllers/admin/users_controller.rb")
    assert controller_content !~ /def new/
    assert controller_content !~ /def create/
    assert controller_content !~ /def edit/
    assert controller_content !~ /def update/

    controller_spec_content = File.read("tmp/spec/controllers/admin/users_controller_spec.rb")
    assert controller_spec_content !~ /GET new/
    assert controller_spec_content !~ /POST create/
    assert controller_spec_content !~ /GET edit/
    assert controller_spec_content !~ /PUT update/
  end
end
