# Providers

In widget based DIs and non widget based DIs we often need to put our Biz layer injector in a location that should pair up with the screen receiving the View Model. Thus we name the ViewModel to pair it with the domain model and then collect them in this folder close to the screens.

Gist: In both widget based and non widget based DIs the View Model DI is and should be called the provider. That also means that the other DIs that do not inject View Models can be said to represent rest of the App Model.