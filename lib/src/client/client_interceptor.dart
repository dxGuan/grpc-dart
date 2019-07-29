import 'dart:async';

import '../shared/status.dart';
import 'call.dart';
import 'method.dart';

/// A gRPC outbound interceptor.
///
/// An interceptor used to intercepts all requests just before being
/// sent to remote endpoint.
/// If the interceptor returns a [GrpcError] .....
/// If the interceptor returns null, the corresponding [ClientCall] will be processed.
typedef ClientOutboundInterceptor = FutureOr<GrpcError> Function(
    ClientMethod method, Stream requests, CallOptions options);

/// A gRPC inbound interceptor.
///
/// An interceptor used to intercepts all headers and/or trailers from remove endpoint
/// just before they are being completed in [Response]
/// If the interceptor returns a [GrpcError] means error has been thrown while
/// interceptor was processing.
typedef ClientInboundInterceptor = FutureOr<GrpcError> Function(
    {Map<String, String> header, Map<String, String> trailer});
