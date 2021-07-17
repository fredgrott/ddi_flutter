// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Use Cases: To sand box non-pure functions we do not need 
//            to weigh it down with any extra logging or defined 
//            app exceptions. We just need to account for:
//                 void functions
//                 type functions
//                 Future functions, ie a typed function

typedef AVoidFunction = void Function();



/// Sandboxes a non returning function. Used for non-pure functions
/// that may trigger effects beyond the core of app such as systems,
/// outside services, etc.
/// @author Fredrick Allan Grott
void guardVoided<T>(AVoidFunction callback) {
  try {
    callback();
  } catch (err) {
    throw Exception(err);
  }
}




/// Sand boxing a returning function that offers a default value if function
/// miss-behaves.
/// @author Fredrick Allan Grott
T? guardDefaultValue<T>(T Function() callback, [T? defaultValue]) {
  T result;

  try {
    result = callback();
  } catch (err) {
    throw Exception(err);
  }

  return result ?? defaultValue;
}

///
/// @author Fredrick Allan Grott
Future<T> asyncGuardDefaultValue<T>(Future<T> Function() callback,
    [T? defaultValue,]) async {
  T result;

  try {
    result = callback() as T;
  } catch (err) {
    throw Exception(err);
  }

  return result ?? defaultValue as T;
}
