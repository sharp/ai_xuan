# sharp_admin

Code generator of CRUD admin controllers, views. It helps you get the data on screen immediately, so you can customize the specifics to your liking.

It works with Rails 4 and uses: [ransack](https://github.com/activerecord-hackery/ransack) for search, [kaminari](https://github.com/amatsuda/kaminari) for pagination, [simple_form](https://github.com/plataformatec/simple_form) for form builder.

## Usage

Include it in your Gemfile:

```
gem "sharp_admin", '1.1.2'
```

Run the generator:
```
rails g model model_name
rails g sharp_admin model_name --search_by name_or_email --ns=super_admin
```

The `--search_by` option is not required. However, it's useful most of the time, and you can use any ransack-compatible expression to search in string or text fields.

Other options available are:

* `--ns` - namespace for your admin, default is admin

