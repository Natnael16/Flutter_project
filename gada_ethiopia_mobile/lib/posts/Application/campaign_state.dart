import '../../lib.dart';

class CampaignState {}

class Idle extends CampaignState {}

class CreatingPost extends CampaignState {}

class CreateSuccess extends CampaignState {}

class CreateFailed extends CampaignState {}

class PickingImage extends CampaignState {}

class PickSuccess extends CampaignState {}

class PickFail extends CampaignState {}

class LoadSuccess extends CampaignState {
  final List<Post> posts;
  LoadSuccess({required this.posts});
}

class LoadFailed extends CampaignState {}

class LoadingHome extends CampaignState {}
