import 'package:agent_data/agent_data.dart';
import 'package:core/flutter_riverpod.dart';

class AgentListController extends StateNotifier<AgentListScreenUiState> {
  AgentListController(this._agentRepository)
      : super(const AgentListScreenUiState());

  static final provider = StateNotifierProvider.autoDispose<AgentListController,
      AgentListScreenUiState>((ref) {
    return AgentListController(ref.watch(AgentRepository.provider));
  });

  final AgentRepository _agentRepository;

  void onScreenLoaded() {
    _loadAgentList();
  }

  void onAgentListRetried() {
    _loadAgentList();
  }

  Future<void> _loadAgentList() async {
    state = state.copyWith(agentListUiState: const AsyncValue.loading());
    final agentList =
        await AsyncValue.guard(() => _agentRepository.getAgentList());
    if (!mounted) return;
    state = state.copyWith(agentListUiState: agentList);
  }
}

class AgentListScreenUiState {
  const AgentListScreenUiState({
    this.agentListUiState = const AsyncValue.loading(),
  });

  final AsyncValue<List<Agent>> agentListUiState;

  AgentListScreenUiState copyWith({
    AsyncValue<List<Agent>>? agentListUiState,
  }) {
    return AgentListScreenUiState(
      agentListUiState: agentListUiState ?? this.agentListUiState,
    );
  }
}
