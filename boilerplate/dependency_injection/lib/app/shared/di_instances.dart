// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// some DI implementations use a Service Locator pattern. The one we are using is an IoC DI container
// pattern so we use a container that initializes every DI entity.
import 'package:dependency_injection/app/shared/app_model_container.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

final injector = ModuleContainer().initialize(Injector());

final logInstance = injector.get<ApplicationLogger>();

final appPropertiesInstance = injector.get<AppProperties>();
// ignore: type_annotate_public_apis
// ignore: always_declare_return_types
//dynamic logInstance.getLogger().info(dynamic logInstance.diID);
