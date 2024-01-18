abstract class UseCase<Params, Result> {
  Future<Result> call(Params params);
}

abstract class NoParamUseCase<Result> {
  Future<Result> call();
}