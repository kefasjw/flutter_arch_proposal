class Agent {
  Agent({
    required this.id,
    required this.name,
    required this.status,
  });

  final String id;

  final String name;

  final AgentStatus status;
}

enum AgentStatus {
  active,
  inactive,
  retired,
}
