# devops-demo-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['devops-demo']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### devops-demo::default

Include `devops-demo` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[devops-demo::default]"
  ]
}
```

## License and Authors

Author:: Darrin Wortlehock (darrin@wortlehock.net)
