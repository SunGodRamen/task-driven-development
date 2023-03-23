
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
<h1>Project Template with Docker</h1>
<p>This project template provides a consistent and reproducible development environment using Docker. The environment
  includes Neovim, Taskwarrior, Draw.io, Git, Node.js, and Ruby, with custom configurations and integrations for
  seamless interaction between these tools.</p>
<h2>Prerequisites</h2>
<p>To use this Docker-based development environment, you need to have Docker installed on your system. Visit the <a
    href="https://docs.docker.com/get-docker/" target="_new">official Docker website</a> for installation
  instructions.</p>
<h2>Building the Docker Image</h2>
<ol>
  <li>
    <p>Clone the repository:</p>
    <pre><div class="bg-black rounded-md mb-4"><div class="flex items-center relative text-gray-200 bg-gray-800 px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>bash</span><button class="flex ml-auto gap-2"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-bash">git <span class="hljs-built_in">clone</span> https://github.com/your-username/your-project-template.git
<span class="hljs-built_in">cd</span> your-project-template
</code></div></div></pre>
  </li>
  <li>
    <p>Build the Docker image:</p>
    <pre><div class="bg-black rounded-md mb-4"><div class="flex items-center relative text-gray-200 bg-gray-800 px-4 py-2 text-xs font-sans justify-between rounded-t-md"><button class="flex ml-auto gap-2"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs">docker build -t your-image-name .
</code></div></div></pre>
    <p>Replace <code>your-image-name</code> with a name of your choice for the Docker image.</p>
  </li>
</ol>
<h2>Running the Docker Container</h2>
<ol>
  <li>
    <p>Run the Docker container, mounting your project directory:</p>
    <pre><div class="bg-black rounded-md mb-4"><div class="flex items-center relative text-gray-200 bg-gray-800 px-4 py-2 text-xs font-sans justify-between rounded-t-md"><span>bash</span><button class="flex ml-auto gap-2"><svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" class="h-4 w-4" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>Copy code</button></div><div class="p-4 overflow-y-auto"><code class="!whitespace-pre hljs language-bash">docker run -it --<span class="hljs-built_in">rm</span> -p 3000:3000 -p 8080:8080 -v /path/to/your/proj:/home/developer/proj your-image-name
</code></div></div></pre>
    <p>Replace <code>/path/to/your/proj</code> with the path to your project directory on the host machine.</p>
    <p>This command will expose ports 3000 and 8080 from the container to the host, allowing you to access web
      applications served on these ports.</p>
  </li>
  <li>
    <p>The container will start a Zsh shell session. From here, you can use Neovim, Taskwarrior, Draw.io, Git,
      Node.js, and Ruby as you normally would in your development environment.</p>
  </li>
</ol>
<h2>Accessing Web Applications</h2>
<p>If you start a web server or web application inside the container, it will be accessible on the host machine's
  browser. For example:</p>
<ul>
  <li>If you start a React app on port 3000 inside the container, visit <code>http://localhost:3000</code> on the host
    machine's browser.</li>
  <li>If you start a Ruby HTTP endpoint on port 8080 inside the container, visit <code>http://localhost:8080</code> on
    the host machine's browser.</li>
</ul>
<p>To access the Draw.io diagram, you can either serve it as a static file using a web server or directly open the
  file in the host machine's browser, given that the project directory is mounted to the container.</p>