import 'enum_class.dart';

enum ProjectSize { SMALL, MEDIUM, LARGE, ICEBERG }

class ProjectSizeType extends EnumClass<ProjectSize> {
  const ProjectSizeType(ProjectSize ix, String txt) : super(ix, txt);

  static const ProjectSizeType small =
      ProjectSizeType(ProjectSize.SMALL, 'Small (<5m)');
  static const ProjectSizeType medium =
      ProjectSizeType(ProjectSize.MEDIUM, 'Medium (5-10m)');
  static const ProjectSizeType large =
      ProjectSizeType(ProjectSize.LARGE, 'Large (10-50m)');
  static const ProjectSizeType iceberg =
      ProjectSizeType(ProjectSize.ICEBERG, 'Iceberg (50m+)');

  List<ProjectSizeType> values() => [small, medium, large, iceberg];
}

enum ProjectComplexity { LOW, MEDIUM, HIGH, VERY_HIGH }

class ProjectComplexityType extends EnumClass<ProjectComplexity> {
  const ProjectComplexityType(ProjectComplexity ix, String txt)
      : super(ix, txt);

  static const low = ProjectComplexityType(ProjectComplexity.LOW, 'Low');
  static const medium =
      ProjectComplexityType(ProjectComplexity.MEDIUM, 'Medium');
  static const high = ProjectComplexityType(ProjectComplexity.HIGH, 'High');
  static const very_high =
      ProjectComplexityType(ProjectComplexity.VERY_HIGH, 'Very High');

  List<ProjectComplexityType> values() => [low, medium, high, very_high];
}

enum ProjectCriticality { LOW, MEDIUM, HIGH, VERY_HIGH }
const projectCriticalityDescriptions = ['Low', 'Medium', 'High', 'Very High'];
final projectCriticalityDefinitions = Map.fromIterables(
    ProjectCriticality.values, projectCriticalityDescriptions);

enum ClientType { SYSTEM_INTEGRATOR, END_CLIENT }
const clientTypeDefinitions = {
  ClientType.SYSTEM_INTEGRATOR: 'System Integrator',
  ClientType.END_CLIENT: 'End client',
};

enum SolutionType { IAAS, PAAS, SAAS }
const solutionTypeDefinitions = {
  SolutionType.IAAS: 'IaaS',
  SolutionType.PAAS: 'PaaS',
  SolutionType.SAAS: 'SaaS'
};

enum ResellerType { EA, CSP }
const resellerTypeDefinitions = {
  ResellerType.EA: 'EA',
  ResellerType.CSP: 'CSP'
};

enum CloudProviderType { MSAzure, Google, AWS, AliBaba }
const cloudProviderDefinitions = {
  CloudProviderType.MSAzure: 'MS Azure',
  CloudProviderType.Google: 'Google',
  CloudProviderType.AWS: 'Amazon Web Services',
  CloudProviderType.AliBaba: 'Alibaba',
};

class ClientModel {
  String companyName;
  String orgNo;
  String industry;
  String projectName;
  String projectDescription;
  ProjectSizeType projectSize = ProjectSizeType.small;
  ProjectComplexityType projectComplexity = ProjectComplexityType.low;
  ProjectCriticality projectCriticality = ProjectCriticality.LOW;
  CloudProviderType cloudProvider;
  ClientType clientType = ClientType.SYSTEM_INTEGRATOR;
  SolutionType solutionType = SolutionType.IAAS;
  ResellerType resellerType = ResellerType.EA;
}

var clientConfiguration = ClientModel();

const kHtml = '''
<h1>Heading</h1>
<p>A paragraph with <strong>strong</strong> <em>emphasized</em> text.</p>
<ol>
  <li>List item number one</li>
  <li>
    Two
    <ul>
      <li>2.1 (nested)</li>
      <li>2.2</li>
    </ul>
  </li>
  <li>Three</li>
</ol>
<p>And YouTube video!</p>
<iframe src="https://www.youtube.com/embed/jNQXAC9IVRw" width="560" height="315"></iframe>
''';
