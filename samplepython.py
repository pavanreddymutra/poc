def get_nested_value(obj, key):
    keys = key.split('/')  # Split the key into individual path components

    # Traverse the object to retrieve the nested value
    for k in keys:
        if isinstance(obj, dict) and k in obj:
            obj = obj[k]
        else:
            return None  # Key or intermediate key not found
    
    return obj

# Example usage
object1 = {"a": {"b": {"c": "d"}}}
key1 = "a/b/c"
value1 = get_nested_value(object1, key1)
print(value1)  # Output: d

object2 = {"x": {"y": {"z": "a"}}}
key2 = "x/y/z"
value2 = get_nested_value(object2, key2)
print(value2)  # Output: a
