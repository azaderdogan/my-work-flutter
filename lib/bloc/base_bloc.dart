abstract class BaseBloc<T> {
  Future<void> getAll();

  Future<void> getById(int id);

  Future<void> insert(T object);

  Future<void> delete(int id);

  Future<void> update(T object);

  Future<void> deleteAll();
}
