# jumpwire Configuration
You are able to configure jumpwire depending on your project. Here are some defaults.
To use jumpwire you have to call the setup function. And below here are some common used configurations.
Be aware that you cannot use overlapping file types at the same time.
And the order is [important (spec.ts and ts)](#angular)

## vim
Put a configuration in the language table.
``` vim
lua require('jumpwire').setup({ config = { language = {
                        \  ['ts'] = {
                        \    test = { type = 'fileExtension', data = 'test.ts'},
                        \    style = { type = 'fileExtension', data = 'css'},
                        \  },
                        \ }}})
```
## lua
Put a configuration in the language table.
```lua
require('jumpwire').setup({ language = {
  ['ts'] = {
    test = { type = 'fileExtension', data = 'test.ts'},
    style = { type = 'fileExtension', data = 'css'},
  },
}})
```

## Defaults
- [angular](#angular)
- [java](#java)
- [kotlinlang](#kotlinlang)
- [reactjs](#reactjs)
- [svelte](#svelte)
- [vuejs](#vuejs)

### angular
```lua
['spec.ts'] = {
  implementation = { type = 'fileExtension', data = 'ts'},
  markup = { type = 'fileExtension', data = 'html'},
  style = { type = 'fileExtension', data = 'css'}
},
['ts'] = {
  test = { type = 'fileExtension', data = 'spec.ts'},
  markup = { type = 'fileExtension', data = 'html'},
  style = { type = 'fileExtension', data = 'css'},
},
['html'] = {
  implementation = { type = 'fileExtension', data = 'ts'},
  test = { type = 'fileExtension', data = 'spec.ts'},
  style = { type = 'fileExtension', data = 'css'}
},
['css'] = {
  implementation = { type = 'fileExtension', data = 'ts'},
  test = { type = 'fileExtension', data = 'spec.ts'},
  markup = { type = 'fileExtension', data = 'html'},
},
```

### java
```lua
['java'] = {
  implementation = { type = 'jvm', data = 'implementation'},
  test = { type = 'jvm', data = 'test'},
},
```

### kotlinlang
```lua
['kt'] = {
  implementation = { type = 'jvm', data = 'implementation'},
  test = { type = 'jvm', data = 'test'},
},
```

### reactjs
```lua
['test.ts'] = {
  implementation = { type = 'fileExtension', data = 'ts'},
  style = { type = 'fileExtension', data = 'css'}
},
['ts'] = {
  test = { type = 'fileExtension', data = 'test.ts'},
  style = { type = 'fileExtension', data = 'css'},
},
['css'] = {
  implementation = { type = 'fileExtension', data = 'ts'},
  test = { type = 'fileExtension', data = 'test.ts'},
},
```

### vuejs
```lua
['test.ts'] = {
  implementation = { type = 'fileExtension', data = 'ts'},
  markup = { type = 'fileExtension', data = 'vue'},
  style = { type = 'fileExtension', data = 'vue'}
},
['ts'] = {
  test = { type = 'fileExtension', data = 'test.ts'},
  markup = { type = 'fileExtension', data = 'vue'},
  style = { type = 'fileExtension', data = 'vue'},
},
['vue'] = {
  implementation = { type = 'lineContains', data = '<script'},
  test = { type = 'fileExtension', data = 'test.ts'},
  markup = { type = 'lineContains', data = '<template'},
  style = { type = 'lineContains', data = '<style'}
},
```

### svelte
```lua
['test.ts'] = {
  implementation = { type = 'fileExtension', data = 'ts'},
  markup = { type = 'fileExtension', data = 'svelte'},
  style = { type = 'fileExtension', data = 'svelte'}
},
['ts'] = {
  test = { type = 'fileExtension', data = 'test.ts'},
  markup = { type = 'fileExtension', data = 'svelte'},
  style = { type = 'fileExtension', data = 'svelte'},
},
['svelte'] = {
  implementation = { type = 'lineContains', data = '<script'},
  test = { type = 'fileExtension', data = 'test.ts'},
  markup = { type = 'lineContains', data = '<div'},
  style = { type = 'lineContains', data = '<style'}
},
```
