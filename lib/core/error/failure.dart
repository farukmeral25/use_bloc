abstract class Failure {}

class BadRequestFailure implements Failure {}

class NotFoundFailure implements Failure {}

class InternalFailure implements Failure {}

class UnauthorizedFailure implements Failure {}

class ForbiddenFailure implements Failure {}

class GatewayTimeOutFailure implements Failure {}
