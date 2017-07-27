# Support system

## Requirements
* ruby: 2.4.1
* mariadb: 10.1
* redis: 4.0

## Setup

```ShellSession
$ asdf install
$ bin/setup
$ rails s
$ sidekiq # in separate session
```

As a system administrator you can add new statuses without a need to modify existing code:
```ShellSession
$ rails c
> Status.new(id: 'duplicated', name: 'Duplicated', kind: :closed)
```
where kind must be one of `closed`, `opened` or `on_hold`.

You can modify list of departments in `config/departments.txt`.

## Other
Ruby warnings are disabled in `.envrc` (install `donenv` for this).
