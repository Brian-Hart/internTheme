<style>
	.image-wrapper-${Name.getData()} {
		background-image: url(${header_image.getData()});
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		height: 200px;
		width: 100%;
	}

	.review-body {
		height: 264px;
		overflow: hidden;
		padding: 10px;
	}

	.review-full-review {
		min-height: 64px;
	}

	.review-name {
		color: #CA9B52;
		font-size: 20px;
	}

	.review-wrapper {
		background-color: #FFF;
		box-shadow: 2px 2px 10px 1px #aaa;
		min-height: 484px;
		width: 100%;
	}

	.star-spans {
		color: #CA9B52;
		display: inline-block;
		float: right;
		font-size: 20px;
	}
</style>

<div class="review-wrapper">
	<#if header_image.getData()?? && header_image.getData() != "">
		<div class="image-wrapper-${Name.getData()}"></div>
	</#if>

	<div class="review-body">
		<span class="review-name">
			${Name.getData()}
		</span>

		<div id="star-spans-${Name.getData()}" class="star-spans"></div>

		<h3 class="review-abstract">
			${Abstract.getData()}
		</h3>

		<p class="review-full-review">
			${Full_Review.getData()}
		</p>
	</div>
</div>

<script>
	var myRating = parseInt(${Rating.getData()});

	function addStars(rating) {
		var ratingElement = document.getElementById("star-spans-${Name.getData()}");

		for (var i = 0; i < rating; i++) {
			var starSpan = document.createElement('span');
			starSpan.className = "glyphicon glyphicon-star";
			ratingElement.appendChild(starSpan);
		}

		for (var j = 0; j < 5 - e; j++) {
			var emptyStarSpan = document.createElement('span');
			emptyStarSpan.className = "glyphicon glyphicon-star-empty";
			ratingElement.appendChild(emptyStarSpan);
		}
	}

	addStars(myRating);
</script>