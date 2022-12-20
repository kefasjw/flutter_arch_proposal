import 'package:agent/src/list/agent_list_controller.dart';
import 'package:agent_data/agent_data.dart';
import 'package:core/core.dart';
import 'package:core/flutter_riverpod.dart';
import 'package:flutter/material.dart';

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
      ref.read(AgentListController.provider.notifier).onScreenLoaded();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localizations.agents)),
      body: Consumer(
        builder: (context, ref, child) {
          final agentListUiState = ref.watch(
            AgentListController.provider
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
          ref.read(AgentListController.provider.notifier).onAgentListRetried();
        },
        child: Text(context.localizations.retry),
      ),
    );
  }
}
