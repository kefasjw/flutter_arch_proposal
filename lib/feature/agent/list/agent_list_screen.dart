import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/core/model/agent.dart';
import 'package:flutter_arch_proposal/feature/agent/list/agent_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgentListScreen extends ConsumerStatefulWidget {
  const AgentListScreen({super.key});

  @override
  ConsumerState<AgentListScreen> createState() => _AgentListScreenState();
}

class _AgentListScreenState extends ConsumerState<AgentListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(AgentListViewModel.provider.notifier).onScreenLoaded();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent List'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final agentListUiState = ref.watch(
            AgentListViewModel.provider
                .select((state) => state.agentListUiState),
          );
          return agentListUiState.when(
            data: (data) => _agentList(data),
            error: (error, stackTrace) => _retry(),
            loading: () => _loading(),
          );
        },
      ),
    );
  }

  Widget _agentList(List<Agent> agentList) {
    return ListView.builder(
      itemCount: agentList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _agentCard(agentList[index]),
        );
      },
    );
  }

  Widget _agentCard(Agent agent) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(agent.id),
            const SizedBox(height: 16.0),
            Text(agent.name),
          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _retry() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ref.read(AgentListViewModel.provider.notifier).onAgentListRetried();
        },
        child: const Text('Retry'),
      ),
    );
  }
}
