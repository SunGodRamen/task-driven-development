
<p>Title: Project Management and Codebase Consistency Enforcement System</p>
<h2>Introduction</h2>
<p>This project template aims to develop a system that enforces consistency between project management tasks,
  architectural diagrams, and the codebase. It combines the capabilities of Neovim, Taskwarrior, Draw.io, and Git to
  create a cohesive and efficient environment for managing project-related tasks, documentation, and code. The system
  employs Git hooks to ensure that branches, commits, and pushes adhere to specific rules that maintain the
  relationship between tasks, diagrams, and code changes.</p>
<h2>System Overview</h2>
<p>The system integrates the following tools and enforces specific rules and guidelines through Git hooks, ensuring
  that tasks, diagrams, and code changes are linked and consistent:</p>
<ol>
  <li>Neovim: A highly configurable text editor used to manage code and other project files.</li>
  <li>Taskwarrior: A command-line task management tool used to track and organize project tasks.</li>
  <li>Draw.io: A diagramming tool used to create and maintain architectural diagrams in HTML format.</li>
  <li>Git: A distributed version control system used to manage the project's codebase.</li>
</ol>
<h2>Project Template Structure</h2>
<p>The project template includes the following files and directories:</p>
<pre><div class="bg-black rounded-md mb-4"><div class="flex items-center relative text-gray-200 bg-gray-800 px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>kotlin</span><button class="flex ml-auto gap-2"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-kotlin">project_name/
├── .drawio/
│   └── diagram.drawio.html
├── .git_hooks/
│   ├── pre-commit
│   └── pre-push
├── .nvim/
│   ├── project-config.vim
│   └── init.vim
├── .task/
│   ├── project-tasklist.zsh
│   ├── backlog.data
│   ├── completed.data
│   ├── pending.data
│   └── undo.data
├── .README.md
├── .taskrc
└── .gitignore
</code></div></div></pre>
<h3>Neovim Configuration</h3>
<p>The <code>project-config.lua</code> file is sourced in the user's <code>init.vim</code> and loads the
  project-specific Neovim configuration from the <code>.nvim/init.lua</code> file located at the project root.</p>
<h3>Taskwarrior Configuration</h3>
<p>The <code>project-taskwarrior.zsh</code> file is sourced in the user's <code>zshrc</code> and provides a
  <code>taskp</code> function for running Taskwarrior commands with the project-specific <code>.taskrc</code> file
  located in the <code>.task/</code> directory.</p>
<h3>Draw.io Architectural Diagram</h3>
<p>The <code>.drawio/</code> directory contains the <code>diagram.drawio.html</code> file, which is the architectural
  diagram describing the project. Users must update the diagram when adding new files to the codebase.</p>
<h3>Git Configuration and Hooks</h3>
<p>The Git hooks are located in the <code>.git/hooks/</code> directory and ensure that branches are tied to
  Taskwarrior entries and that matching entries are added to the Draw.io diagram before pushing new files.</p>
<h2>Usage</h2>
<ol>
  <li>
    <p>Set up your Neovim configuration to source the <code>project-config.lua</code> file.</p>
  </li>
  <li>
    <p>Source the <code>project-taskwarrior.zsh</code> script in your <code>zshrc</code>.</p>
  </li>
  <li>
    <p>Create a custom <code>.taskrc</code> file in the project's <code>.task/</code> directory and set the
      <code>data.location</code> and <code>hooks.location</code> variables to point to the project's
      <code>.task/data/</code> and <code>.task/hooks/</code> directories, respectively.</p>
  </li>
  <li>
    <p>Set up Git hooks by following the instructions provided in previous responses.</p>
  </li>
  <li>
    <p>Update the Draw.io architectural diagram in the <code>.drawio/diagram.drawio.html</code> file whenever you add
      new files to the codebase.</p>
  </li>
</ol>
<p>With this setup, you can use Neovim, Taskwarrior, Draw.io, and Git seamlessly in your project while maintaining
  consistency between tasks, diagrams, and code changes.</p>
