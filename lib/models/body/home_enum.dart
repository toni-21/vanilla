enum HomeViewEnum {
  dashboard(0, 'Home'),
  activity(1, 'Activity'),
  support(2, 'Support'),
  profile(3, 'Profile');

  const HomeViewEnum(this.ind, this.name);

  final int ind;
  final String name;
}
