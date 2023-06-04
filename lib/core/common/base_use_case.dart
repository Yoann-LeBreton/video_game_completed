mixin BaseUsecase<T, Params>{
  Future<T> execute({required Params parameters});
}

mixin BaseUseCaseNoParams<T>{
  Future<T> execute();
}