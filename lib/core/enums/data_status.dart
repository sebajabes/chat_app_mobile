enum DataStatus {
  initial,
  loading,
  fetching,
  loaded,
  refreshing,
  submitting,
  deleting,
  success,
  error,
  loadingMore,
  updating;

  bool get isInitial => this == DataStatus.initial;
  bool get isLoading => this == DataStatus.loading;
  bool get isFetching => this == DataStatus.fetching;
  bool get isLoaded => this == DataStatus.loaded;
  bool get isRefreshing => this == DataStatus.refreshing;
  bool get isSubmitting => this == DataStatus.submitting;
  bool get isDeleting => this == DataStatus.deleting;
  bool get isSuccess => this == DataStatus.success;
  bool get isLoadingMore => this == DataStatus.loadingMore;
  bool get isUpdating => this == DataStatus.updating;
}
