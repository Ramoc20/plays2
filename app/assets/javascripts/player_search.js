document.addEventListener("turbo:load", () => {
  const searchInput = document.getElementById("player-search");
  const searchResults = document.getElementById("search-results");

  if (
    searchInput &&
    searchInput.getAttribute("data-listener-attached") === "false"
  ) {
    searchInput.addEventListener("input", async (event) => {
      console.log("DEBUG: input event triggered");
      const query = event.target.value;
      if (query.length < 3) {
        searchResults.innerHTML = "";
        searchResults.style.display = "none";
        return;
      }

      try {
        const searchUrl = `/players/search_results?q=${encodeURIComponent(
          query
        )}`;

        const response = await fetch(searchUrl);

        const players = await response.json();

        searchResults.innerHTML = "";
        for (const player of players) {
          const playerLink = document.createElement("a");
          playerLink.href =
            player.player_type === "nba"
              ? `/nba/${player.slug}`
              : `/mlb/${player.slug}`;
          playerLink.classList.add("search-result");

          const playerImage = document.createElement("img");
          playerImage.src = player.image;
          playerImage.alt = player.name;
          playerImage.classList.add("search-result-image");

          const playerName = document.createTextNode(player.name);

          playerLink.appendChild(playerImage);
          playerLink.appendChild(playerName);
          searchResults.appendChild(playerLink);
        }

        searchInput.setAttribute("data-listener-attached", "true");
        searchResults.style.display = "block";
      } catch (error) {
        console.error("Error in search:", error);
      }
    });
  }
});
