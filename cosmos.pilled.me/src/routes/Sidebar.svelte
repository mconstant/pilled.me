<script>
    import {
        Sidebar,
        SidebarBrand,
        SidebarGroup,
        SidebarItem,
        SidebarDropdownItem,
        SidebarDropdownWrapper
    } from 'flowbite-svelte';

    export let activeUrl;
    export let site;
</script>

<Sidebar
	{activeUrl}
	asideClass="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0 h-full px-3 py-4 overflow-y-auto bg-gray-50 dark:bg-gray-800"
>
	<SidebarBrand {site} />
	<SidebarGroup>
		<SidebarItem label="🪐 What is Cosmos" href={`/what-is`} active={activeUrl === '/what-is'}
		></SidebarItem>
	</SidebarGroup>
	<SidebarGroup border>
		<SidebarItem label="🚀 Blast Off" href={`/blast-off`} active={activeUrl === '/blast-off'}
		></SidebarItem>
		<SidebarItem label="▶️ First Steps" href={`/first-steps`} active={activeUrl === '/first-steps'}
		></SidebarItem>
	</SidebarGroup>
	<SidebarGroup border>
		<SidebarItem label="🚨 Must Knows" href={`/must-knows`} active={activeUrl === '/must-knows'}
		></SidebarItem>
		<SidebarItem label="🏛️ Get Keplr Wallet"></SidebarItem>
		<SidebarItem label="🪙 Get Coinbase"></SidebarItem>
	</SidebarGroup>
	<SidebarGroup border>
		<SidebarDropdownWrapper label="📈 Try Osmosis">
			<SidebarDropdownItem label="foo" />
			<SidebarDropdownItem label="bar" />
		</SidebarDropdownWrapper>
		<SidebarDropdownWrapper label="🌩️ Try Akash">
			<SidebarDropdownItem label="foo" />
			<SidebarDropdownItem label="bar" />
		</SidebarDropdownWrapper>
		<SidebarDropdownWrapper label="🤐 Try Secret Network">
			<SidebarDropdownItem label="🖼️ Get NFTs Privately Using Stashh" />
			<SidebarDropdownItem label="bar" />
		</SidebarDropdownWrapper>
		<SidebarDropdownWrapper label="🚶‍♀️ Try Stride">
			<SidebarDropdownItem label="foo" />
			<SidebarDropdownItem label="bar" />
		</SidebarDropdownWrapper>
		<SidebarDropdownWrapper label="🧬 Try Injective">
			<SidebarDropdownItem label="foo" />
			<SidebarDropdownItem label="bar" />
		</SidebarDropdownWrapper>
	</SidebarGroup>
</Sidebar>