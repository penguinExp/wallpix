import 'package:wallpix/core/errors/custom_failure.c.dart';

/// The failure occurs when api returns the value of 404 or the server is
/// down and api call returns a failure
class ServerFailure extends CustomFailure {}

/// This failure occurs when local data field models are unable to parse 
/// data from remote sources. This can occur if data models on the server side
/// are changed or if there is a mistake in the DTO's
class DataParsingFailure extends CustomFailure {}

/// This failure occurs when user is not connected to any network, and hence
/// wallpix is not able to fetch data
class ConnectivityFailure extends CustomFailure {}

/// This failure occurs when user search for an img by query and keyword and 
/// api returns an empty list, it signifies that api does not have results 
/// matching the query 
class SearchFailure extends CustomFailure {}