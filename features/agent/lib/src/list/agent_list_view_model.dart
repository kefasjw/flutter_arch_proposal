import 'package:agent_domain/agent_domain.dart';
import 'package:shared_dependency/flutter_riverpod.dart';

class AgentListViewModel extends StateNotifier<AgentListScreenUiState> {
  AgentListViewModel(this._agentRepository)
      : super(const AgentListScreenUiState());

  static final provider = StateNotifierProvider.autoDispose<AgentListViewModel,
      AgentListScreenUiState>((ref) {
    return AgentListViewModel(ref.watch(AgentRepository.provider));
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
