import 'package:agent_core/src/model/agent.dart';
import 'package:shared_dependency/flutter_riverpod.dart';

class AgentRepository {
  static final provider = Provider((ref) => AgentRepository());

  Future<List<Agent>> getAgentList() async {
    await Future.delayed(const Duration(seconds: 2));
    return agentData;
  }

  Future<Agent> getAgent(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    return agentData.firstWhere((agent) => agent.id == id);
  }
}

final agentData = [
  Agent(id: '465BA13251', name: 'Ahmad Fikri', status: AgentStatus.active),
  Agent(id: '465BA15022', name: 'Saifunnuha ST', status: AgentStatus.inactive),
  Agent(id: '465BA13303', name: 'Sari', status: AgentStatus.retired),
  Agent(id: '465BA13254', name: 'Ahmad Fikri', status: AgentStatus.active),
  Agent(id: '465BA15025', name: 'Saifunnuha ST', status: AgentStatus.inactive),
  Agent(id: '465BA13306', name: 'Sari', status: AgentStatus.retired),
  Agent(id: '465BA13257', name: 'Ahmad Fikri', status: AgentStatus.active),
];
