enum AsyncValueState { loading, success, error }

class AsyncValue<T> {
  final T? data;
  final Object? error;
  final AsyncValueState state;

  const AsyncValue.loading():
    data = null,
    error = null,
    state = AsyncValueState.loading;

  const AsyncValue.success(this.data):
    error = null,
    state = AsyncValueState.success;

  const AsyncValue.error(this.error):
    data = null,
    state = AsyncValueState.error;
} 
