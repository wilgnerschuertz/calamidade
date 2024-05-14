import 'package:either_dart/either.dart';
import 'package:app/app/core/errors/errors.dart';

typedef Output<T> = Either<BaseException, T>;
