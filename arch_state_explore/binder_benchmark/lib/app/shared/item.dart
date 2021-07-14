// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class Item {
  Item(this.id, this.value);

  int id;
  int value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}



final List<Item> list = List.generate(100, (index) => Item(index+1, index+1));
