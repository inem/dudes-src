It just tries to do something useful...

Try `ruby proto.rb` (and play with examples)! For `examples/lib/things_collection.rb` it currently returns this:

```
[{:name=>"ThingCollection",
  :methods=>
   [{:name=>:initialize, :args=>1, :length=>2, :conditions=>0},
    {:name=>:all_types, :args=>0, :length=>5, :conditions=>0},
    {:name=>:one_type_things, :args=>1, :length=>9, :conditions=>0},
    {:name=>:one_thing_by_type, :args=>2, :length=>9, :conditions=>0},
    {:name=>:weather_clothing, :args=>1, :length=>10, :conditions=>0},
    {:name=>:message, :args=>1, :length=>6, :conditions=>1}],
  :references=>["Dir", "Thing"]}]
```

Nearest TODO:
* class methods
* SVG prototype
* try on more examples (can be commited right here!)