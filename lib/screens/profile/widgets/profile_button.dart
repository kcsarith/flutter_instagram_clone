import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/screens/edit-profile/edit_profile_screen.dart';
import 'package:flutter_instagram_clone/screens/profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileButton extends StatelessWidget {
  final bool isCurrentUser;
  final bool isFollowing;

  const ProfileButton(
      {Key key, @required this.isCurrentUser, @required this.isFollowing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (isCurrentUser)
        ? TextButton(
            onPressed: () => Navigator.of(context).pushNamed(
                EditProfileScreen.routeName,
                arguments: EditProfileScreenArgs(context: context)),
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Edit Profile',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          )
        : TextButton(
            onPressed: () => isFollowing
                ? context.read<ProfileBloc>().add(ProfileUnfollowUser())
                : context.read<ProfileBloc>().add(ProfileFollowUser()),
            style: TextButton.styleFrom(
              backgroundColor: isFollowing
                  ? Colors.grey[300]
                  : Theme.of(context).primaryColor,
            ),
            child: Text(
              isFollowing ? 'Unfollow' : 'Follow',
              style: TextStyle(
                  fontSize: 16.0,
                  color: isFollowing ? Colors.black : Colors.white),
            ),
          );
  }
}
