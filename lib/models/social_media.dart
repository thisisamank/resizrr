import 'package:resizrr/models/content_type.dart';

class SocialMediaTypes {
  SocialMediaTypes({
    this.name = '',
    this.contentType = const [],
  });
  final String name;
  final List<ContentType> contentType;

  SocialMediaTypes copyWith({
    String? name,
    List<ContentType>? contentType,
  }) {
    return SocialMediaTypes(
      name: name ?? this.name,
      contentType: contentType ?? this.contentType,
    );
  }

  final List<SocialMediaTypes> _list = [
    SocialMediaTypes(
      name: 'Instagram',
      contentType: [
        ContentType(
          name: 'Post',
          height: 100,
          width: 100,
          pixelRatio: 1080 / 100,
        ),
        ContentType(
          name: 'Story',
          height: 177.78,
          width: 100,
          pixelRatio: 1080 / 100,
        ),
      ],
    ),
  ];

  List<SocialMediaTypes> get listOfSocialMedia => _list;
}
