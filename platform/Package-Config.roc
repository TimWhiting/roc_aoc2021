platform examples/cli
    requires {}{ main : Task {} [] , roc_read_file: Task Str []} # TODO FIXME
    exposes []
    packages {}
    imports [ Task.{ Task } ]
    provides [ mainForHost, readFile ]
    effects fx.Effect
        {
            putLine : Str -> Effect {},
            getLine : Effect Str
        }

mainForHost : Task {} [] as Fx
mainForHost = main

readFile = roc_read_file