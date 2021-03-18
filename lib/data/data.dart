
import 'package:fitsked/models/practicas.model.dart';

final _am = Practica(
    imageUrl: 'assets/images/a-m.jpg',
    tipo: 'Artes Marciales'
);

final _crossfit = Practica(
    imageUrl: 'assets/images/crossfit.jpg',
    tipo: 'Crossfit'
);

final _box = Practica(
    imageUrl: 'assets/images/box.jpg',
    tipo: 'Boxeo'
);

final _gym = Practica(
    imageUrl: 'assets/images/gym.jpg',
    tipo: 'Gimnasio'
);

final _p_t = Practica(
    imageUrl: 'assets/images/p-t.webp',
    tipo: 'Personal'
);

final _spinning = Practica(
    imageUrl: 'assets/images/spinning.jpg',
    tipo: 'Spinning'
);
final List<Practica> practicas = [
  _am,
  _box,
  _crossfit,
  _p_t,
  _gym,
  _spinning
];