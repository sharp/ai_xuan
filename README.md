# sharp_admin

Code generator of CRUD admin controllers, views and specs for existing ActiveRecord models. It helps you get the data on screen immediately, so you can customize the specifics to your liking.

It works with Rails 4 and uses [ransack](https://github.com/activerecord-hackery/ransack) for search and [kaminari](https://github.com/amatsuda/kaminari) for pagination.

## Usage

Include it in your Gemfile:

```
gem "sharp_admin"
```

Run the generator:
```
bundle exec rails g admin_view User --search_by name_or_email --ns=super_admin
```

The `--search_by` option is not required. However, it's useful most of the time, and you can use any ransack-compatible expression to search in string or text fields.

Other options available are:

* `--no_create` - omit functionality to create a new record
* `--ns` - namespace for your admin, default is admin

