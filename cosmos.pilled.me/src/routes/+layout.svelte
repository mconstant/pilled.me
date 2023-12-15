<script>
	import '../app.pcss';
	import logoUrl from '/images/cosmos-space-gravity-planet-svgrepo-com.svg';
	import { page } from '$app/stores';
	import { goto } from '$app/navigation';
	import { onMount } from 'svelte';
	import { NavHamburger } from 'flowbite-svelte';
	let isOpen = false;

	import {
		Sidebar,
		SidebarBrand,
		SidebarGroup,
		SidebarItem,
		SidebarDropdownItem,
		SidebarDropdownWrapper
	} from 'flowbite-svelte';

	let site = {
		name: 'cosmos.pilled.me',
		href: '/blast-off',
		img: logoUrl
	};

	// use $page.path directly
	$: activeUrl = $page.url.pathname;
	onMount(() => {
		if (activeUrl === '/') {
			goto('/blast-off');
		}
	});
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

<div class="flex px-4 mx-auto w-full">
	<main class="main-content lg:ml-72 w-full mx-auto p-4 flex items-center justify-center">
		<slot />
	</main>
</div>

<style>
	.main-content {
		margin-top: 20px; /* Adjust this value as needed */
	}
</style>
